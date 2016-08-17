from system.core.model import Model
import re
EMAIL_REGEX = re.compile(r'^[a-za-z0-9\.\+_-]+@[a-za-z0-9\._-]+\.[a-za-z]*$')

class Poke(Model):
	def __init__(self):
		super(Poke, self).__init__()

	def poke_user(self, id1, id2):
		query = "INSERT INTO pokes (pokes_num, user_id, poker_id) VALUES (1, :u_id, :p_id) ON DUPLICATE KEY UPDATE pokes_num = pokes_num + 1;"
		data = {
			'u_id': id1,
			'p_id': id2
		}
		return self.db.query_db(query, data)

	def poked_me(self, id):
		query = "SELECT name, COUNT(poker_id) AS total FROM users LEFT JOIN pokes ON pokes.poker_id = users.id WHERE user_id = :id GROUP BY name ORDER BY total desc;"
		data = {
			'id': id
		}
		return self.db.query_db(query, data)


	def display_total_pokes(self, id):
		query = "SELECT COUNT(DISTINCT(poker_id)) AS total, name FROM pokes LEFT JOIN users ON users.id = pokes.user_id WHERE users.id = :id"
		data = {
			'id': id
		}
		return self.db.query_db(query, data)

	def display_users(self, id):
		query = "SELECT users.id AS u_id, name, alias, email, COUNT(pokes.user_id) as total FROM users LEFT JOIN pokes ON pokes.user_id = users.id WHERE NOT users.id IN(SELECT users.id FROM users LEFT JOIN pokes ON pokes.user_id = users.id WHERE users.id = :id) GROUP BY name"

		data = {'id': id}
		return self.db.query_db(query, data)

	def register_user(self, info):
		errors = {}

		if len(info['reg_name']) < 2:
			errors.update({'reg_name': 'Name must be at least 2 characters long'})
		if len(info['reg_alias']) < 2:
			errors.update({'reg_alias': 'Alias must be at least 2 characters long'})
		if not EMAIL_REGEX.match(info['reg_email']):
			errors.update({'reg_email': 'Please enter a valid email address'})
		if len(info['reg_password']) < 8:
			errors.update({'reg_password':'Password must be at least 8 characters'})
		if info['reg_confirm'] != info ['reg_password']:
			errors.update({'reg_confirm': 'Passwords must be matching'})
		if len(info['reg_dob']) < 1:
			errors.update({'reg_dob': 'Please enter your Date of birth'})
		if len(errors) > 0:
			return errors
		else:
			pw_hash = self.bcrypt.generate_password_hash(info['reg_password'])
			query = "INSERT INTO users (name, alias, email, password, dob, created_at) VALUES (:name, :alias, :email, :password, :dob, NOW())"
			data = {
				'name': info['reg_name'],
				'alias': info['reg_alias'],
				'email': info['reg_email'],
				'password': pw_hash,
				'dob': info['reg_dob']
			}
			self.db.query_db(query, data)
		return 'registered'

	def login_user(self, info):
		errors = {}

		if not EMAIL_REGEX.match(info['log_email']):
			errors.update({'log_email': 'Please enter a valid email address'})
		if len(info['log_password']) < 8:
			errors.update({'log_password': 'Password must be at least 8 characters'})
		if len(errors) > 0:
			return errors
		else:
			query = "SELECT * FROM users WHERE email = :email LIMIT 1"
			data = {
				'email': info['log_email']
			}
			user = self.db.query_db(query, data)
			if user == []:
				errors.update({'nouser': 'Email is not registered'})
				return errors
			else:
				if self.bcrypt.check_password_hash(user[0]['password'], info['log_password']):
					logged_user = {'logged_user':{'id': user[0]['id'], 'name':user[0]['name'], 'alias': user[0]['alias'], 'email': user[0]['email'], 'created_at': user[0]['created_at']}}
					return logged_user
				else:
					errors.update({'passmatch': 'Password entered does not match registered email'})
					return errors

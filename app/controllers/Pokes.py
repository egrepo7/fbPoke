from system.core.controller import *

class Pokes(Controller):
	def __init__(self, action):
		super(Pokes, self).__init__(action)
		self.load_model('Poke')
		self.db = self._app.db

	def index(self):
		return self.load_view('main.html')

	def logout(self):
		session.clear()
		return redirect('/')

	def userpage(self):
		data = self.models['Poke'].display_users(session['logged_user']['id'])
		total = self.models['Poke'].display_total_pokes(session['logged_user']['id'])
		poked = self.models['Poke'].poked_me(session['logged_user']['id'])
		return self.load_view('userpage.html', data = data, total = total, poked = poked)

	def poke_user(self,id1, id2):
		poke = self.models['Poke'].poke_user(id1, id2)
		return redirect('/userpage')

	def register(self):
		newuser = self.models['Poke'].register_user(request.form)
		if newuser == 'registered':
			session['success'] = 'You have succesfully registered. Please log in!'
			return redirect('/')
		else:
			session.clear()
			errors = newuser
			flash(errors)
		return redirect('/')

	def login(self):
		signedin = self.models['Poke'].login_user(request.form)
		if 'logged_user' in signedin:
			session['logged_user'] = signedin['logged_user']
			return redirect('/userpage')
		else:
			session.clear()
			errors = signedin
			flash(errors)
		return redirect('/')


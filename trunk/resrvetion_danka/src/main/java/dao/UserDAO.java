package dao;

import java.util.Collection;
import java.util.List;

import model.User;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class UserDAO extends HibernateDaoSupport {
	

	@SuppressWarnings("unchecked")
	public boolean checkUser(User user){
		String query = "from User user where user.username='"+user.getUsername()+"' and user.password='"+user.getPassword()+"'";
		
		List<Object> result = getHibernateTemplate().find(query);
		if(result.size() > 0)
			return true;
		
		return false;
	}
	
	public void save(User user) {
		getHibernateTemplate().save(user); //save single user in db
	}
	
	@SuppressWarnings("unchecked")
	public Collection<User> loadAll() {
		return getHibernateTemplate().loadAll(User.class); //get all entries from db
	}

	public User load(User user, Long id) {
		User usr;
		usr = (User)getHibernateTemplate().load(User.class, id); //get all entries from db
		getHibernateTemplate().initialize(usr) ;
		return usr;
	}	
	
	@SuppressWarnings("unchecked")
	public User load(Class userClass, Long id){
		User usr;
		usr = (User)getHibernateTemplate().load(userClass, id); //get all entries from db
		getHibernateTemplate().initialize(usr) ;
		return usr;
	}
	
	public void delete(User user) {
		getHibernateTemplate().delete(user); //delete single user in db
	}	
	public void update(User user) {
		getHibernateTemplate().update(user); //delete single user in db
	}
	
	@SuppressWarnings("unchecked")
	public Long getUserId(User user){
		Long id = 0L;
		
		String query = "select user.id from User user where user.username='"+user.getUsername()+"'";
		
		List<Object> result = getHibernateTemplate().find(query);
		if(result.size() > 0)
			return (Long)result.get(0);
		
		return id;
	}
	
	@SuppressWarnings("unchecked")
	public Long getUserId(String userName){
		Long id = 0L;
		
		String query = "select user.id from User user where user.username='"+userName+"'";
		
		List<Object> result = getHibernateTemplate().find(query);
		if(result.size() > 0)
			return (Long)result.get(0);
		
		return id;
	}
}

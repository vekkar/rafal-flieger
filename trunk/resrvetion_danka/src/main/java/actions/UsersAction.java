package actions;

import java.util.Collection;
import java.util.Map;

import model.User;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import dao.UserDAO;


public class UsersAction extends ActionSupport implements SessionAware{
	
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private User user;
	private Collection<User> users;
	private Map<Object, Object> session;
	private Object sessionObject;
	
	
	public String showAllUsers()
	{
		sessionObject = getSession().get("username");
		if(sessionObject != null){
			setUsers(userDAO.loadAll());
			setSessionObject(sessionObject);
		}
		else{
			return ERROR;
		}
		return SUCCESS;
	}
	public String deleteUser()
	{
		sessionObject = getSession().get("username");
		setUser(userDAO.load(user, user.getId()));
		userDAO.delete(user);
		setUsers(userDAO.loadAll());
		setSessionObject(sessionObject);
		return SUCCESS;
	}
	public String goToUpdateUser()
	{
		sessionObject = getSession().get("username");
		setUser(userDAO.load(user, user.getId()));
		setSessionObject(sessionObject);
		return SUCCESS;
	}
	public String updateUser()
	{
		//setUser(userDAO.load(user, user.getId()));
		User user2 = userDAO.load(user, user.getId());  
		user2.setUsername(user.getUsername());
		user2.setPassword(user.getPassword());
		userDAO.update(user2);
		setUsers(userDAO.loadAll());
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		return SUCCESS;
	}
	public String addNewUser()
	{
		userDAO.save(user);
		setUsers(userDAO.loadAll());
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		return SUCCESS;
	}
	
	public String showAddNewUser(){
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		return SUCCESS;
	}
	
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUsers(Collection<User> users) {
		this.users = users;
	}

	public Collection<User> getUsers() {
		return users;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Object getSessionObject() {
		return sessionObject;
	}
	public void setSessionObject(Object sessionObject) {
		this.sessionObject = sessionObject;
	}
	
	@SuppressWarnings("unchecked")
    public void setSession(Map session) {
        this.session = session;
    }

	public Map<Object, Object> getSession() {
		return session;
	}

	
}

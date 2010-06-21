package actions;

import model.User;
import dao.UserDAO;
import com.opensymphony.xwork2.ActionSupport;
import java.util.*;
import org.apache.struts2.interceptor.SessionAware;


public class HelloAction extends ActionSupport implements SessionAware{
	
	private static final long serialVersionUID = 1L;
	
	private User user;
	private UserDAO userDAO;
	private Map<Object, Object> session;
	
	public String execute() throws Exception{
		boolean isUser = userDAO.checkUser(user);
		
		if(isUser){
			getSession().put("username", getUser().getUsername());
			Long id = userDAO.getUserId(user);
			userDAO.load(user, id);
		}
		else{
			return ERROR;
		}
		
		return SUCCESS;
	}

	public String logout() throws Exception{
		if(getSession().get("username")!=null){
			getSession().remove("username");
			return SUCCESS;
		}
		
		return ERROR;
	}
	
	public void setUser(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}

	@SuppressWarnings("unchecked")
    public void setSession(Map session) {
        this.session = session;
    }

	public Map<Object, Object> getSession() {
		return session;
	}
}

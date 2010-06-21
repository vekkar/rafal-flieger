package actions;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import model.Building;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import dao.BuildingDAO;


public class BuildingsAction extends ActionSupport implements SessionAware{
	
	private static final long serialVersionUID = 1L;
	private Building building;
	private BuildingDAO buildingDAO;
	private List<Building> buildings;
	private Map<Object, Object> session;
	private Object sessionObject;
	
	public String deleteBuilding()
	{
		setBuilding(buildingDAO.load(building, building.getId()));
		buildingDAO.delete(building);
		setBuildings(buildingDAO.loadAll());
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		return SUCCESS;
	}
	public String updateBuilding()
	{
		//setUser(userDAO.load(user, user.getId()));
		Building device2 = buildingDAO.load(building, building.getId());  
		device2.setBuildingName(building.getBuildingName());
		buildingDAO.update(device2);
		setBuildings(buildingDAO.loadAll());
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		return SUCCESS;
	}
	public String goToUpdateBuilding()
	{
		setBuilding(buildingDAO.load(building, building.getId()));
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		return SUCCESS;
	}
	public String addNewBuilding()
	{
		buildingDAO.save(building);
		setBuildings(buildingDAO.loadAll());
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		return SUCCESS;
	}
	public String showAllBuildings()
	{
		sessionObject = getSession().get("username");
		if(sessionObject != null){
			setBuildings(buildingDAO.loadAll());
			setSessionObject(sessionObject);
		}
		else{
			return ERROR;
		}
		return SUCCESS;
	}
	public Building getBuilding() {
		return building;
	}
	public void setBuilding(Building building) {
		this.building = building;
	}
	public BuildingDAO getBuildingDAO() {
		return buildingDAO;
	}
	public void setBuildingDAO(BuildingDAO buildingDAO) {
		this.buildingDAO = buildingDAO;
	}
	public Collection<Building> getBuildings() {
		return buildings;
	}
	public void setBuildings(List<Building> buildings) {
		this.buildings = buildings;
	}

	public Object getSessionObject() {
		return sessionObject;
	}
	public void setSessionObject(Object sessionObject) {
		this.sessionObject = sessionObject;
	}
	public String showAddBuildings(){
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
    public void setSession(Map session) {
        this.session = session;
    }

	public Map<Object, Object> getSession() {
		return session;
	}




	
}

package actions;

import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import model.Building;
import model.Room;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import dao.BuildingDAO;
import dao.RoomDAO;

public class RoomsAction extends ActionSupport implements SessionAware{
	
	private static final long serialVersionUID = 1L;
	private RoomDAO roomDAO;
	private BuildingDAO buildingDAO;
	private Room room;
	private Building building;
	
	public Building getBuilding() {
		return building;
	}
	public void setBuilding(Building building) {
		this.building = building;
	}

	private Collection<Room> rooms;
	private Collection<Building> buildings;
	private Map<Object, Object> session;
	private Object sessionObject;
	
	public String deleteRoom()
	{		
		Building building2 = roomDAO.load(room, room.getId()).getBuilding();
		
		Long id = buildingDAO.load(building2, building2.getId()).getId();
		
		setRoom(roomDAO.load(room, room.getId()));
		roomDAO.delete(room);

		setRooms(roomDAO.loadSelectedRooms(id));
		
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		return SUCCESS;
	}
	public String updateRoom()
	{
		Room room2 = roomDAO.load(room, room.getId());  
		room2.setRoomName(room.getRoomName());
		roomDAO.update(room2);
		
		Building building2 = roomDAO.load(room, room.getId()).getBuilding();
		
		Long id = buildingDAO.load(building2, building2.getId()).getId();
		setRooms(roomDAO.loadSelectedRooms(id));
		
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		return SUCCESS;
	}
	public String goToUpdateRoom()
	{
		setRoom(roomDAO.load(room, room.getId()));
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String showAllRooms()
	{
		sessionObject = getSession().get("username");
		if(sessionObject != null){
			Long id = buildingDAO.load(building, building.getId()).getId();
			
			Collection<Room> rooms = roomDAO.loadSelectedRooms(id);
			if(rooms.size() > 0){
				Iterator roomsItr = rooms.iterator();
				Room room = null;
				while (roomsItr.hasNext()) {
					room = (Room) roomsItr.next();
					if(room.getReservation() != null){
						Date date = new Date();
						if(room.getReservation().getEndDate().before(date)){
							room.setFree(1);
						}
					}
					
		       }
		    }
			
			setRooms(rooms);
			setSessionObject(sessionObject);
		}else{
			return ERROR;
		}
		return SUCCESS;
	}
	public String addNewRoom()
	{
		Building building1 = buildingDAO.load(building, building.getId());
		room.setBuilding(building1);
		room.setFree(1);
		
		roomDAO.save(room);
		
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		return SUCCESS;
	}
	
	public BuildingDAO getBuildingDAO() {
		return buildingDAO;
	}
	public void setBuildingDAO(BuildingDAO buildingDAO) {
		this.buildingDAO = buildingDAO;
	}
	
	public String loadBuilding(){
		setBuilding(buildingDAO.load(building, building.getId()));
		
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		
		return SUCCESS;
	}
	
	public String showResources(){
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		
		return SUCCESS;
	}
	
	public RoomDAO getRoomDAO() {
		return roomDAO;
	}


	public void setRoomDAO(RoomDAO roomDAO) {
		this.roomDAO = roomDAO;
	}


	public Collection<Room> getRooms() {
		return rooms;
	}

	public void setRooms(Collection<Room> rooms) {
		this.rooms = rooms;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}

	public Collection<Building> getBuildings() {
		return buildings;
	}
	public void setBuildings(Collection<Building> buildings) {
		this.buildings = buildings;
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

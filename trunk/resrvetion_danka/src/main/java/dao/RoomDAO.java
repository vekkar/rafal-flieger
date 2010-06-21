package dao;

import java.util.Collection;

import model.Room;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class RoomDAO extends HibernateDaoSupport {
	
	public void save(Room room) {
		getHibernateTemplate().save(room); //save single user in db
	}
	@SuppressWarnings("unchecked")
	public Collection<Room> getFreeRoom() {
		String query = "from Room room where room.free=1";
		Collection<Room> result = getHibernateTemplate().find(query);
		return result;
	}
	@SuppressWarnings("unchecked")
	public Collection<Room> searchForRoom(Long id) {
		String query = "from Room room where room.reservation.id="+id;
		Collection<Room> result = getHibernateTemplate().find(query);
		return result;
	}
	@SuppressWarnings("unchecked")
	public Collection<Room> loadAll() {
		return getHibernateTemplate().loadAll(Room.class); //get all entries from db
	}
	public Room load(Room room1, Long id) {
		Room room;
		room = (Room)getHibernateTemplate().load(Room.class, id); //get all entries from db
		getHibernateTemplate().initialize(room) ;
		return room;
	}	
	
	@SuppressWarnings("unchecked")
	public Collection<Room> loadSelectedRooms(Long buildingId){
		String query = "from Room room where room.building.id="+buildingId;
		Collection<Room> result = getHibernateTemplate().find(query);
		return result;
	}
	
	public void delete(Room room) {
		getHibernateTemplate().delete(room); //delete single user in db
	}	
	public void update(Room room) {
		getHibernateTemplate().update(room); 
	}
}

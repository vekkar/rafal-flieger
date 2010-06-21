package actions;

import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import model.Device;
import model.Reservation;
import model.Room;
import model.User;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import dao.DeviceDAO;
import dao.ReservationDAO;
import dao.RoomDAO;
import dao.UserDAO;


public class ReservationsAction extends ActionSupport implements SessionAware{
	
	private static final long serialVersionUID = 1L;
	private ReservationDAO reservationDAO;
	private Reservation reservation;
	private Collection<Reservation> reservations;
	private Map<Object, Object> session;
	private Object sessionObject;
	/*ZMIENIONE*/
	private Room room;
	private RoomDAO roomDAO;
	private Device device;
	private DeviceDAO deviceDAO;
	private User user;
	private UserDAO userDAO;
	private Collection<Room> rooms;
	private Collection<Device> devices;
	
	@SuppressWarnings("unchecked")
	public String searchForReservation()
	{
		sessionObject = getSession().get("username");
	
		Date enddate, startdate;

		setSessionObject(sessionObject);
		
		Long userId = reservationDAO.getUserId(reservation.getUser().getUsername());
		reservation.getUser().setId(userId);
		enddate = reservation.getEndDate();
		startdate = reservation.getStartDate();

		setReservations(reservationDAO.search(reservation));

		for(Iterator i = reservations.iterator(); i.hasNext();)
		{
			setReservation((Reservation)i.next());
			if (reservation.getEndDate() != null && reservation.getStartDate() != null)
			{
				if (reservation.getEndDate().after(enddate) || reservation.getStartDate().before(startdate))
					i.remove();
			}
		}

		return SUCCESS;
	}
	
	public String markResAsFinishedAction()
	{
		setReservation(reservationDAO.load(reservation, reservation.getId()));


		releaseResources(reservation.getId());
		reservationDAO.delete(reservation);


		showAllReservations();
		//releaseResources();
		return SUCCESS;
	}
	public String showAllReservations()
	{
		sessionObject = getSession().get("username");
		Long userId = reservationDAO.getUserId((String)sessionObject);
		if(sessionObject != null){
			if (sessionObject.equals("admin"))
				setReservations(reservationDAO.loadAll());
			else 
				setReservations(reservationDAO.loadUserReservations(userId));
			setSessionObject(sessionObject);
		}else{
			return ERROR;
		}
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public void releaseResources(Long id)
	{
		setRooms(roomDAO.searchForRoom(id));
		setDevices(deviceDAO.searchForDevices(id));
		for(Iterator i = rooms.iterator(); i.hasNext();)
		{
			setRoom((Room)i.next());
			room.setFree(1);
			roomDAO.update(room);
		}
		for(Iterator i = devices.iterator(); i.hasNext();)
		{
			setDevice((Device)i.next());
			device.setFree(1);
			deviceDAO.update(device);
		}
	}
	public String deleteReservation()
	{
		setReservation(reservationDAO.load(reservation, reservation.getId()));
		reservationDAO.delete(reservation);
		setReservations(reservationDAO.loadAll());
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		return SUCCESS;
	}
	public String updateReservation()
	{
		//setUser(userDAO.load(user, user.getId()));
		Reservation reservation2 = reservationDAO.load(reservation, reservation.getId());  
		reservation2.setReservationName(reservation.getReservationName());
		reservationDAO.update(reservation2);
		setReservations(reservationDAO.loadAll());
		
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		return SUCCESS;
	}
	public String goToUpdateReservation()
	{
		setReservation(reservationDAO.load(reservation, reservation.getId()));
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		return SUCCESS;
	}
	
	/*ZMIENIONE*/
	public String goToAddRoomReservation(){
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		
		setRoom(roomDAO.load(room, room.getId()));
		
		return SUCCESS;
	}
	
	/*ZMIENIONE*/
	public String addNewRoomReservation()
	{
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		
		Long id = userDAO.getUserId((String)sessionObject);
		user = userDAO.load(User.class, id);
		reservation.setUser(user);
		
		Date date = new Date();
		if(reservation.getEndDate().before(date))
			System.out.println("DATA !!!!!!!!!!!!! "+reservation.getEndDate());
		
		reservationDAO.save(reservation);

		Room room1 = roomDAO.load(room, room.getId());
		room1.setReservation(reservation);
		//room1.setFree(0);
		roomDAO.update(room1);
		
		setReservations(reservationDAO.loadAll());
		
		return SUCCESS;
	}
	public String goToAddDeviceReservation(){
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		
		setDevice(deviceDAO.load(device, device.getId()));
		
		return SUCCESS;
	}
	
	/*ZMIENIONE*/
	public String addNewDeviceReservation()
	{
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		
		Long id = userDAO.getUserId((String)sessionObject);
		user = userDAO.load(User.class, id);
		reservation.setUser(user);
		
		reservationDAO.save(reservation);

		Device device1 = deviceDAO.load(device, device.getId());
		device1.setFree(0);
		device1.setReservation(reservation);
		deviceDAO.update(device1);
		
		setReservations(reservationDAO.loadAll());
		
		return SUCCESS;
	}
	public ReservationDAO getReservationDAO() {
		return reservationDAO;
	}


	public void setReservationDAO(ReservationDAO reservationDAO) {
		this.reservationDAO = reservationDAO;
	}


	public Collection<Reservation> getReservations() {
		return reservations;
	}


	public void setReservations(Collection<Reservation> reservations) {
		this.reservations = reservations;
	}


	public Reservation getReservation() {
		return reservation;
	}


	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}
	public Object getSessionObject() {
		return sessionObject;
	}
	public void setSessionObject(Object sessionObject) {
		this.sessionObject = sessionObject;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public RoomDAO getRoomDAO() {
		return roomDAO;
	}

	public void setRoomDAO(RoomDAO roomDAO) {
		this.roomDAO = roomDAO;
	}
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public Collection<Room> getRooms() {
		return rooms;
	}
	public void setRooms(Collection<Room> rooms) {
		this.rooms = rooms;
	}
	public Collection<Device> getDevices() {
		return devices;
	}
	public void setDevices(Collection<Device> devices) {
		this.devices = devices;
	}
	public Device getDevice() {
		return device;
	}

	public void setDevice(Device device) {
		this.device = device;
	}

	public DeviceDAO getDeviceDAO() {
		return deviceDAO;
	}

	public void setDeviceDAO(DeviceDAO deviceDAO) {
		this.deviceDAO = deviceDAO;
	}

	@SuppressWarnings("unchecked")
    public void setSession(Map session) {
        this.session = session;
    }

	public Map<Object, Object> getSession() {
		return session;
	}



	
}

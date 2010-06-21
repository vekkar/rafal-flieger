package actions;

import java.util.Collection;
import java.util.Map;

import model.Device;


import com.opensymphony.xwork2.ActionSupport;

import dao.DeviceDAO;
import org.apache.struts2.interceptor.SessionAware;


public class DevicesAction extends ActionSupport implements SessionAware {
	
	private static final long serialVersionUID = 1L;
	private Device device;
	private DeviceDAO deviceDAO;
	private Collection<Device> devices;
	private Map<Object, Object> session;
	private Object sessionObject;
	
	public String deleteDevice()
	{
		setDevice(deviceDAO.load(device, device.getId()));
		deviceDAO.delete(device);
		setDevices(deviceDAO.loadAll());
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		return SUCCESS;
	}
	public String updateDevice()
	{
		//setUser(userDAO.load(user, user.getId()));
		Device device2 = deviceDAO.load(device, device.getId());  
		device2.setDeviceName(device.getDeviceName());
		deviceDAO.update(device2);
		setDevices(deviceDAO.loadAll());
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		return SUCCESS;
	}
	public String goToUpdateDevice()
	{
		setDevice(deviceDAO.load(device, device.getId()));
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		return SUCCESS;
	}
	public String addNewDevice()
	{
		deviceDAO.save(device);
		setDevices(deviceDAO.loadAll());
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		return SUCCESS;
	}
	public String showAllDevices()
	{
		sessionObject = getSession().get("username");
		if(sessionObject != null){
			setDevices(deviceDAO.loadAll());
			setSessionObject(sessionObject);
		}
		else{
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String showAddDevices(){
		sessionObject = getSession().get("username");
		setSessionObject(sessionObject);
		
		return SUCCESS;
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

	public Collection<Device> getDevices() {
		return devices;
	}

	public void setDevices(Collection<Device> devices) {
		this.devices = devices;
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

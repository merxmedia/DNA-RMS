package action;

import java.util.List;
import java.util.Map;

import model.Structure;
import model.User;
import model.internal.Message;
import model.listini.Convention;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

@ParentPackage(value="default")
public class ConventionAction extends ActionSupport implements SessionAware{
	private Map<String, Object> session = null;
	private Message message = new Message();
	private List<Convention> conventions = null;
	private Convention convention = null;
	
	@Actions({
		@Action(value="/findAllConventions",results = {
				@Result(name="success",location="/conventions.jsp")
		}) 
		
	})
	public String findAllConventions(){
		User user = null;
		Structure structure = null;
	
		user = (User)this.getSession().get("user");
		structure = user.getStructure();
		this.setConventions(structure.getConventions());
		return SUCCESS;		
	}
	
	@Actions({
		@Action(value="/goUpdateConvention",results = {
				@Result(name="success",location="/convention_edit.jsp")
		})
	})
	public String goUpdateConvention() {
		User user = null;
		Structure structure = null;
		
		user = (User)session.get("user");
		structure = user.getStructure();
		this.setConvention(structure.findConventionById(this.getConvention().getId())); 
		return SUCCESS;
	}
	
	@Actions({
		@Action(value="/saveUpdateConvention",results = {
				@Result(type ="json",name="success", params={
						"root","message"
				})
		})
		
	})
	public String saveUpdateConvention(){
		User user = null;
		Structure structure = null;
		Convention oldConvention = null;
		
		user = (User)session.get("user");
		structure = user.getStructure();
		
		oldConvention = structure.findConventionById(this.getConvention().getId());
		if(oldConvention == null){
			//Si tratta di una aggiunta
			this.getConvention().setId(structure.nextKey());
			structure.addConvention(this.getConvention());
			this.getMessage().setResult(Message.SUCCESS);
			this.getMessage().setDescription("Convention added successfully");
			
		}else{
			//Si tratta di un update
			structure.updateConvention(this.getConvention());
			this.getMessage().setResult(Message.SUCCESS);
			this.getMessage().setDescription("Convention updated successfully");
		}
		return SUCCESS;		
	}
	
	@Actions({
		@Action(value="/deleteConvention",results = {
				@Result(type ="json",name="success", params={
						"root","message"
				} )
		})
		
	})
	public String deleteConvention(){
		User user = null;
		Structure structure = null;
		Convention currentConvention = null;
		
		user = (User)session.get("user");
		structure = user.getStructure();
		currentConvention = structure.findConventionById(this.getConvention().getId());
		if(structure.removeConvention(currentConvention)){
			this.getMessage().setResult(Message.SUCCESS);
			this.getMessage().setDescription("Convention removed successfully");
			return SUCCESS;
		}else{
			this.getMessage().setResult(Message.ERROR);
			this.getMessage().setDescription("Error deleting convention");
			return ERROR;
		}
	}
	
	

	public Map<String, Object> getSession() {
		return session;
	}



	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
		
	}



	public List<Convention> getConventions() {
		return conventions;
	}



	public void setConventions(List<Convention> conventions) {
		this.conventions = conventions;
	}



	public Convention getConvention() {
		return convention;
	}



	public void setConvention(Convention convention) {
		this.convention = convention;
	}



	public Message getMessage() {
		return message;
	}



	public void setMessage(Message message) {
		this.message = message;
	}
	
	
	

}
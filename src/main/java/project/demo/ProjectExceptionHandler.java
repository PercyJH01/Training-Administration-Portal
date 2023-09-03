package project.demo;


import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.client.ResourceAccessException;

@ControllerAdvice
public class ProjectExceptionHandler {
	
	
	
	@ResponseStatus(value=HttpStatus.NOT_FOUND)
	@ExceptionHandler(value=ResourceAccessException.class)
	public String exceptionHandle(Model m)
	{
		m.addAttribute("message","sorry,Can't find the page that you are looking for!!");
		return "null";
	}
	@ResponseStatus(value=HttpStatus.INTERNAL_SERVER_ERROR)
	@ExceptionHandler(value=NullPointerException.class)
	public String exceptionHandleGeneric(Model m)
	{
		m.addAttribute("message","Exception has occured, Some value is null");
		return "null";
	}
	@ResponseStatus(value=HttpStatus.BAD_REQUEST)
	@ExceptionHandler(value=Exception.class)
	public String exceptionHandleMore(Model m)
	{
		m.addAttribute("message","Exception has occured");
		return "null";
	}
	

}

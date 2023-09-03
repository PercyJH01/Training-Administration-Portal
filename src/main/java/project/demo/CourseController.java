package project.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.demo.dao.CourseDao;
import project.demo.entities.Course;

@Controller
public class CourseController {
	@Autowired
	CourseDao courseDao;
	final static String ADMIN_USERNAME = "user123";
	final static String ADMIN_PASSWORD = "pass123";
//	@RequestMapping(value = "/null")
//	public String openErrorPage() {
//		return "null";
//	}
	
	
	@RequestMapping(value = "/openIndex")
	public String openIndex() {
		return "index";
	}
	@RequestMapping(value = {"/viewCourses", "/openCourseDashBoardPage"})
	public String openCourseDashBoardPage(Model model) {
		
		// Step 1: We have to get the list of course from the database
		List<Course> listOfCourse =courseDao.getListOfCourse();	

		// Step 2: We have to pass the course List to course_dashboard.jsp
		model.addAttribute("listOfCourse", listOfCourse);
		
		return "course_dashboard";
	}
	
	@RequestMapping("/openAddCoursePage")
	public String openAddCoursePage() {
		return "form";
	}

	@RequestMapping(value = "/")
	public String register() {
		return "dash";
	}
	@GetMapping(value = "/login")
	public String login() {
		return "login";
	}
	@GetMapping(value = "/openHomePage")
	public String logout() {
		return "dash";
		
	}
	@GetMapping(value = "/aboutus")
	public String aboutus() {
		return "aboutus";
	}
	@GetMapping(value = "/contact")
	public String contact() {
		return "contact";
	}
	@GetMapping(value = "/services")
	public String services() {
		return "services";
	}
	@RequestMapping(value = "/adminlogin", method = RequestMethod.POST)
	public String checkLogin(
			@RequestParam("username") String username, 
			@RequestParam("password") String password,
			Model model) {
		System.out.println(username+password);
		if(username.equals(ADMIN_USERNAME) && password.equals(ADMIN_PASSWORD)) {
			model.addAttribute("username" , username);
		return "index";
		}
		else {
			model.addAttribute("error", "invalid credentials");
			return "login";
		}
		
	}

	@RequestMapping(path = "/register", method = RequestMethod.POST)
	public String addCourseRequest(@RequestParam("courseName") String courseName,
			@RequestParam("description") String description, @RequestParam("category") String category,
			@RequestParam("audience") String intendedAudience, @RequestParam("benefits") String benefits, Model model) {

		Course course = new Course();

		course.setCourseName(courseName);
		course.setDescription(description);
		course.setCategory(category);
		course.setIntendedAudience(intendedAudience);
		course.setBenefits(benefits);
		System.out.println(course);

		int result = courseDao.insertCourse(course);
		System.out.println("Result = " + result);
		if (result > 0) {
			List<Course> listOfCourse = courseDao.getListOfCourse();
			model.addAttribute("listOfCourse", listOfCourse);
			model.addAttribute("message", "Course Added Successfully");

			return "course_dashboard";
		} else {
			model.addAttribute("message", "Course cannot be added");
			return "course_dashboard";
		}
	}

	@RequestMapping("/showUpdatePage")
	public String update_course() {
		return "update";
	}

	@RequestMapping("/update_course/{courseId}")
	public ModelAndView updateCourse(@PathVariable("courseId") int courseId, Model model) {
		Course course = courseDao.getCourse(courseId);
		model.addAttribute("courseToUpdate", course);
		return new ModelAndView("update");
	}

	@PostMapping("/update/{courseId}")
	public ModelAndView updateCourseRequest(@RequestParam("courseName") String courseName,
			@RequestParam("description") String description, @RequestParam("category") String category,
			@RequestParam("audience") String intendedAudience, @RequestParam("benefits") String benefits,
			@PathVariable("courseId") int courseId) {

		ModelAndView modelAndView = new ModelAndView();

		Course course = new Course();
		course.setCourseId(courseId);
		course.setCourseName(courseName);
		course.setDescription(description);
		course.setCategory(category);
		course.setIntendedAudience(intendedAudience);
		course.setBenefits(benefits);
		System.out.println("updated");

		int result = courseDao.updateCourse(course);

		if (result > 0) {
			List<Course> listOfCourse = courseDao.getListOfCourse();
			modelAndView.addObject("listOfCourse", listOfCourse);
			modelAndView.addObject("message", "Course Updated Successfully");
			modelAndView.setViewName("course_dashboard");
		} else {
			modelAndView.addObject("message", "Course could not be Updated");
			modelAndView.setViewName("update");
		}

		return modelAndView;
	}

	@RequestMapping("/delete_course/{courseId}")
	public ModelAndView deleteCourse(
			@PathVariable("courseId") int courseId, Model model) {
		Course course = courseDao.getCourse(courseId);
		model.addAttribute("courseToDelete", course);
		return new ModelAndView("course_dashboard");
	}

	@RequestMapping("/delete/{courseId}")
	public String deleteBookRequest(@PathVariable("courseId") int courseId, Model model) {

		int result = courseDao.deleteCourse(courseId);

		List<Course> listOfCourse = courseDao.getListOfCourse();
		model.addAttribute("listOfCourse", listOfCourse);

		if (result > 0) {
			model.addAttribute("message", "course deleted successfully");
		} else {
			model.addAttribute("message", "course cannot be deleted");
		}
		return "course_dashboard";
	}

}

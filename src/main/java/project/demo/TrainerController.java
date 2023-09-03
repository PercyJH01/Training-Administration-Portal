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

import project.demo.dao.TrainerDao;
import project.demo.entities.Course;
import project.demo.entities.Trainer;

@Controller
public class TrainerController {
	@Autowired
	TrainerDao trainerDao;
	@RequestMapping("/openDashboard")
	public String openDashboard() {
		return "index";
	}
	@RequestMapping("/openAddTrainer")
	public String openAddTrainerPage() {
		return "trainerAddForm";
	}
	@RequestMapping(path="/addTrainer",method=RequestMethod.POST)
	public String addTrainer(
			@RequestParam("trainerName") String trainerName,
			@RequestParam("qualification") String qualification,
			@RequestParam("trainerDescription") String trainerDescription,
			@RequestParam("year_of_exp") int year_of_exp,
			Model model 
			
			) {
		Trainer trainer=new Trainer();
		trainer.setTrainerName(trainerName);
		trainer.setQualification(qualification);
		trainer.setTrainerDescription(trainerDescription);
		trainer.setYear_of_exp(year_of_exp);
		
		
		int result =trainerDao.insertTrainer(trainer);
		
		System.out.println("result="+result);
		if(result>0) {
			List<Trainer> listOfTrainer=trainerDao.getListOfTrainer();
			model.addAttribute("listOfTrainer",listOfTrainer);
			model.addAttribute("message","tranier added succeful");
			
			return "trainer_dashboard";
			
		}else {
			model.addAttribute("message ","trainer can not be added");
			System.out.println("inside registration method");
			return "trainer_dashboard";
		}
	
	}
	@RequestMapping(value = {"/viewTrainer", "/openTrainerDashBoardPage"})
	public String openTrainerDashBoardPage(Model model) {
		
		// Step 1: We have to get the list of trainer from the database
		List<Trainer> listOfTrainer =trainerDao.getListOfTrainer();	

		// Step 2: We have to pass the trainer List to course_dashboard.jsp
		model.addAttribute("listOfTrainer", listOfTrainer);
		
		return "trainer_dashboard";
	}
	
	@RequestMapping("/UpdateTrainer/{trainerId}")
	public ModelAndView updateTraier(
	
			@PathVariable("trainerId") int trainerId, Model model) 
	{
		System.out.println("error coming");
		Trainer trainer =trainerDao.getTrainer(trainerId);
		model.addAttribute("trainerToupdate",trainer);
		return new ModelAndView("updatetrainer");
		
		
	}
		
//	
	
	@PostMapping("/Update/{trainerId}")
	public ModelAndView updateTrainerRequest(@PathVariable("trainerId") int trainerId,
			
			@RequestParam("trainerName") String trainerName,
			@RequestParam("qualification") String qualification,
			@RequestParam("trainerDescription") String trainerDescription,
			@RequestParam("year_of_exp") int year_of_exp
			) {
		ModelAndView modelAndView=new ModelAndView();
		Trainer trainer=new Trainer();
		trainer.setTrainerId(trainerId);
		trainer.setTrainerName(trainerName);
		trainer.setQualification(qualification);
		trainer.setTrainerDescription(trainerDescription);
		trainer.setYear_of_exp(year_of_exp);
		System.out.println("error");
		
		int result=trainerDao.updateTrainer(trainer);
		
		
		if(result>0) {
			List<Trainer> listofTrainer=trainerDao.getListOfTrainer();
			
			modelAndView.addObject("listOfTrainer",listofTrainer);
			modelAndView.addObject("message","trainer updated Successfully");
			modelAndView.setViewName("trainer_dashboard");
			
		}else {
			modelAndView.addObject("messgae","trainer could not be update");
			modelAndView.setViewName("trainer_dashboard");
		}
		return modelAndView;
		
	}
	@RequestMapping("/deletetrainer/{trainerId}")
	public ModelAndView deletetrainer(
			@PathVariable("trainerId") int trainerId,
			Model model) {
		Trainer trainer=trainerDao.getTrainer(trainerId);
		model.addAttribute("trainerToupdate",trainer);
		return new ModelAndView("trainer_dashboard");
		
		
	}
	@RequestMapping("/delete_trainer/{trainerId}")
	public String deleteTrainer(
			@PathVariable("trainerId") int trainerId,
			Model model) {
		int result =trainerDao.deleteTrainer(trainerId);
		List<Trainer> listOfTrainer=trainerDao.getListOfTrainer();
		model.addAttribute("listOfTrainer",listOfTrainer);
		
		if(result>0) {
			model.addAttribute("message ","trainer deleted succesfuuly");
		}else {
			model.addAttribute("messgae");
			
		}
		return "trainer_dashboard";
		
	}

}

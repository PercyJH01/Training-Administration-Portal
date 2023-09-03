package project.demo;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.demo.dao.TrainingDao;
import project.demo.entities.Trainer;
import project.demo.entities.Training;
@Controller
public class TrainingController {
	@Autowired
	TrainingDao trainingDao;
	
	@RequestMapping("/openAddTrainingPage")
	public String openAddTrainerPage() {
		return "trainingAddForm";
	}
	@RequestMapping("/openDashboardTraining")
	public String openIndexTrainingPage() {
		return "index";
	}
	
	
	@RequestMapping(path="/addTraining",method=RequestMethod.POST)
	public String addTraining(
			@RequestParam("courseId") int courseId,
			@RequestParam("trainerId") int trainerId,
			@RequestParam("start_date") String start_date,
			@RequestParam("end_date")String end_date,
			@RequestParam("fees") double fees,
			@RequestParam("discount") double discount,
			@RequestParam("batchSize") int batchSize,
			Model model 
			
			) {
		Training training=new Training();
		
		training.setCourseId(courseId);
		training.setTrainerId(trainerId);
		training.setStart_date(LocalDate.parse(start_date));
		training.setEnd_date(LocalDate.parse(end_date));
		training.setFees(fees);
		training.setDiscount(discount);
		training.setBatchSize(batchSize);
		
		
		int result =trainingDao.insertTraining(training);
		
		System.out.println("result="+result);
		if(result>0) {
			List<Training> listOfTraining=trainingDao.getListOfTraining();
			model.addAttribute("listOfTraining",listOfTraining);
			model.addAttribute("message","traning added succefully");
			
			return "training_dashboard";
			
		}else {
			model.addAttribute("message ","training can not be added");
		}
		
		System.out.println("inside registration method");
		return "training_dashboard";
	}
	@RequestMapping(value = {"/viewTraining", "/openTrainerDashBoardPage"})
	public String openTrainingViewPage(Model model) {
		
		// Step 1: We have to get the list of trainer from the database
		List<Training> listOfTraining =trainingDao.getListOfTraining();	

		// Step 2: We have to pass the trainer List to course_dashboard.jsp
		model.addAttribute("listOfTraining", listOfTraining);
		
		return "training_dashboard";
	}
	
	@RequestMapping("/Update_Training/{trainingId}")
	public ModelAndView updateTraining(
	
			@PathVariable("trainingId") int trainingId, Model model) 
	{
		System.out.println("error coming");
		Training training =trainingDao.getTraining(trainingId);
		model.addAttribute("trainingToupdate",training);
		return new ModelAndView("updateTraining");
		
		
	}
		
//	
	
	@PostMapping("/UpdateTraining/{trainingId}")
	public ModelAndView updateTrainerRequest(@PathVariable("trainingId") int trainingId,
			
			@RequestParam("courseId") int courseId,
			@RequestParam("trainerId") int trainerId,
			@RequestParam("start_date") String start_date,
			@RequestParam("end_date")String end_date,
			@RequestParam("fees") double fees,
			@RequestParam("discount") double discount,
			@RequestParam("batchSize") int batchSize
			 
			) {
		ModelAndView modelAndView=new ModelAndView();
		Training training=new Training();
		training.setTrainingId(trainingId);
		training.setCourseId(courseId);
		training.setTrainerId(trainerId);
		training.setStart_date(LocalDate.parse(start_date));
		training.setEnd_date(LocalDate.parse(end_date));
		training.setFees(fees);
		training.setDiscount(discount);
		training.setBatchSize(batchSize);
		System.out.println("error");
		
		int result=trainingDao.updateTraining(training);
		List<Training> listOfTraining=trainingDao.getListOfTraining();
		modelAndView.addObject("listOfTraining",listOfTraining);
		
		if(result>0) {
			modelAndView.addObject("message","training updated Successfully");
			modelAndView.setViewName("training_dashboard");
			
		}else {
			modelAndView.addObject("messgae","training could not be update");
			modelAndView.setViewName("training_dashboard");
		}
		return modelAndView;
		
	}
	@RequestMapping("/deletetraining/{trainingId}")
	public ModelAndView deletetraining(
			@PathVariable("trainingId") int trainingId,
			Model model) {
		Training training=trainingDao.getTraining(trainingId);
		model.addAttribute("trainingToupdate",training);
		return new ModelAndView("trainer_dashboard");
		
		
	}
	@RequestMapping("/delete_training/{trainingId}")
	public String deleteTrainer(
			@PathVariable("trainingId") int trainingId,
			Model model) {
		int result =trainingDao.deleteTraining(trainingId);
		List<Training> listOfTraining=trainingDao.getListOfTraining();
		model.addAttribute("listOfTraining",listOfTraining);
		
		if(result>0) {
			model.addAttribute("message ","training deleted succesfuuly");
		}else {
			model.addAttribute("messgae");
			
		}
		return "training_dashboard";
		
	}

}

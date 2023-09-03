package project.demo.dao;

import java.util.List;

import project.demo.entities.Training;

public interface TrainingDao {
	int insertTraining(Training training);
	int updateTraining(Training training);
	int deleteTraining(int trainingId);
	Training getTraining(int trainingId);
	List<Training> getListOfTraining();

}

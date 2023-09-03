package project.demo.dao;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import project.demo.entities.Training;

public class TrainingDaoImpl implements TrainingDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}


	@Override
	public int insertTraining(Training training) {
		String insertQuery="insert into training(courseId,trainerId,start_date,end_date,fees,discount,batchSize)\r\n"
				+ "values(?,?,?,?,?,?,?)";
		if (isScheduleConflict(training.getCourseId(), training.getTrainerId(), training.getStart_date(), training.getEnd_date())) {
	        return -1; 
	    }
		return this.jdbcTemplate.update(insertQuery,training.getCourseId(),training.getTrainerId(),
				training.getStart_date(),training.getEnd_date(),training.getFees(),
				training.getDiscount(),training.getBatchSize());
	}
	private boolean isScheduleConflict(int courseId, int trainerId, LocalDate start_date, LocalDate end_date) {
	    String conflictCheckQuery = "SELECT COUNT(*) FROM training "
	            + "WHERE courseId = ? AND trainerId = ? "
	            + "AND start_date <= ? AND end_date >= ?";
 
	    int count = this.jdbcTemplate.queryForObject(conflictCheckQuery, Integer.class,
	            courseId, trainerId, end_date, start_date);
 
	    return count > 0;
	}
	

	@Override
	public int updateTraining(Training training) {
		String updateQuery="update training set courseId=?,trainerId=?,"
				+ "start_date=?,end_date=?,fees=?,discount=?,batchSize=?"
				+ " where trainingId=?;";
		if (isScheduleConflict(training.getCourseId(), training.getTrainerId(), training.getStart_date(), training.getEnd_date())) {
	        // Handle schedule conflict (return an appropriate error code or throw an exception)
	        return -1; // For example, return -1 to indicate a conflict
	    }
		return this.jdbcTemplate.update(updateQuery,training.getCourseId(),training.
				getTrainerId(),training.getStart_date(),training.getEnd_date()
				,training.getFees(),training.getDiscount(),training.getBatchSize(),
				training.getTrainingId());
	}

	@Override
	public int deleteTraining(int trainingId) {
		String deleteQuery="DELETE FROM training  WHERE  trainingId=?";
		return this.jdbcTemplate.update(deleteQuery,trainingId);
		
	}

	@Override
	public Training getTraining(int trainingId) {
		String getSingleTraining="SELECT * FROM training WHERE trainingId=?";
		return this.jdbcTemplate.queryForObject(getSingleTraining,new TrainingRowMapperImpl(),trainingId);	
		
	}

	@Override
	public List<Training> getListOfTraining() {
		String  fetchAllSTrainingQuery="SELECT * FROM training";

		return this.jdbcTemplate.query(fetchAllSTrainingQuery, new TrainingRowMapperImpl());
	}

}

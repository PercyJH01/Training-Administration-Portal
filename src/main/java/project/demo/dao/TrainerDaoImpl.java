package project.demo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import project.demo.entities.Trainer;

public class TrainerDaoImpl implements TrainerDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int insertTrainer(Trainer trainer) {
		String insertQuery="insert into trainer(trainerName,qualification,trainerDescription,year_of_exp)\r\n"
				+ "values(?,?,?,?)";
		
		return this.jdbcTemplate.update(insertQuery,trainer.getTrainerName(),trainer.getQualification(),
				trainer.getTrainerDescription(),trainer.getYear_of_exp());
	}

	@Override
	public int updateTrainer(Trainer trainer) {
		String updateQuery="update trainer set "
				+ "trainerName=?,qualification=?,trainerDescription=?,"
				+ "year_of_exp=? Where trainerId=?;";
		
		 return this.jdbcTemplate.update(updateQuery,trainer.getTrainerName(),
				trainer.getQualification(),trainer.getTrainerDescription(),
				trainer.getYear_of_exp(),trainer.getTrainerId());
	}

	@Override
	public int deleteTrainer(int trainerId) {
		String deleteQuery="DELETE FROM trainer  WHERE  trainerId=?";
		return this.jdbcTemplate.update(deleteQuery,trainerId);
	}

	@Override
	public Trainer getTrainer(int trainerId) {

		String getSingleTrainer="SELECT * FROM trainer WHERE trainerId=?";
		return this.jdbcTemplate.queryForObject(getSingleTrainer,new TrainerRowMapperImpl(),trainerId);
	}

	@Override
	public List<Trainer> getListOfTrainer() {
		String  fetchAllSTrainerQuery="SELECT * FROM trainer";
//		RowMapper
		return this.jdbcTemplate.query(fetchAllSTrainerQuery, new TrainerRowMapperImpl());
		
	}

}

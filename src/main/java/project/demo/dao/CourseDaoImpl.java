package project.demo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import project.demo.entities.Course;

public class CourseDaoImpl implements CourseDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int insertCourse(Course course) {
		String insertQuery = "insert into course " + "(courseName,description,category,intendedAudience\r\n"
				+ ",benefits) values" + "(?,?,?,?,?)";
		return this.jdbcTemplate.update(insertQuery, course.getCourseName(), course.getDescription(),
				course.getCategory(), course.getIntendedAudience(), course.getBenefits());
	}

	@Override
	public int updateCourse(Course course) {
		String updateQuery = "update course set courseName=?, description=?,category=?,\r\n"
				+ "intendedAudience=?,benefits=? where courseId=?;";

		return this.jdbcTemplate.update(updateQuery, course.getCourseName(), course.getDescription(),
				course.getCategory(), course.getIntendedAudience(), course.getBenefits(),course.getCourseId());
	}

	@Override
	public int deleteCourse(int courseId) {
		String deleteCourseQuery = "DELETE FROM course WHERE courseId = ?";
		return this.jdbcTemplate.update(deleteCourseQuery, courseId);
	}

	@Override
	public List<Course> getListOfCourse() {
		String fetchAllSCourseQuery = "SELECT * FROM course";	
		// RowMapper
		return this.jdbcTemplate.query(
				fetchAllSCourseQuery, new RowMapperImpl());
	}

	@Override
	public Course getCourse(int courseId) {
		String getSingleCourse = "SELECT * from course WHERE courseId = ?";

		return this.jdbcTemplate.queryForObject(getSingleCourse, new RowMapperImpl(), courseId);
	}

}

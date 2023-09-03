package project.demo.dao;

import java.util.List;

import project.demo.entities.Course;

public interface CourseDao {
	int insertCourse(Course course);
	int updateCourse(Course course);
	int deleteCourse(int courseId);
	Course getCourse(int courseId);
	List<Course> getListOfCourse();
}

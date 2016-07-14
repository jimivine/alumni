/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objects;

/**
 *
 * @author jimivine
 */
public class Friend {

    protected String student_name;
    protected String uniname;
    protected String years;
    protected String course;
    protected String status;

    public Friend(String externStudentName, String externUni, String externYears,
            String externCourse, String externStatus) {
        this.student_name = externStudentName;
        this.uniname = externUni;
        this.years = externYears;
        this.course = externCourse;
        this.status = externStatus;
    }

    public Friend(String name) {
        this.student_name = name;
    }

    public String getFriendName() {
        return this.student_name;
    }

    public String getUni() {
        return this.uniname;
    }

    public String getYears() {
        return this.years;
    }

    public String getCourse() {
        return this.course;
    }

    public String getStatus() {
        return this.status;
    }

}

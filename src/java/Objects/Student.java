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
public class Student 
{
    
    protected String full_name;
    protected String uniname;
    protected String years;
    protected String course;
    protected String status;
    
    public Student(String externFullName, String externUni, String externYears,
            String externCourse, String externStatus)
    {
        this.full_name = externFullName;
        this.uniname = externUni;
        this.years = externYears;
        this.course = externCourse;
        this.status = externStatus;
    }
    
    public String getFullName()
    {
        return this.full_name;
    }    
    public String getUni()
    {
        return this.uniname;
    }
    public String getYears()
    {
        return this.years;
    }
    public String getCourse()
    {
        return this.course;
    }
    public String getStatus()
    {
        return this.status;
    }
    
    
}

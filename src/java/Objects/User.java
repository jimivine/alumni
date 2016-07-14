package Objects;

/**
 *
 * @author jimivine
 */
public class User 
{
    private String username;
    private String password;

 
    // Value based constructor 
    public User(String externUsername, String externPassword) 
    { 
        this.username = externUsername;  
        this.password = externPassword; 
    }
    
    // Username getter method 
    public String getUsername() 
    { 
        return this.username; 
    } 
 
    // Username setter method 
    public void setUsername(String externUsername) 
    { 
        this.username = externUsername; 
    } 

    // Password getter method 
    public String getPassword() 
    { 
        return this.password; 
    } 

    // Password setter method 
    public void setPassword(String externPassword) 
    { 
        this.password = externPassword; 
    } 
}

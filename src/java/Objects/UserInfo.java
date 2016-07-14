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
public class UserInfo 
{
    
    protected String username;
    protected String forename;
    protected String surname;
    protected String email;
    protected String description;
    protected String address;
    protected String postcode;
 
    
    public UserInfo(String externUsername, String externForename,
            String externSurname,  String externEmail, String externBio,
            String externAddress, String externPostcode)
    {
        this.username = externUsername;
        this.forename = externForename;
        this.surname = externSurname;
        this.email = externEmail;
        this.description = externBio;
        this.address = externAddress;
        this.postcode = externPostcode;
    }
    
    public String getUsername()
    {
        return this.username;
    }
    public String getForename()
    {
        return this.forename;
    }
    public String getSurname()
    {
        return this.surname;
    }
    public String getEmail()
    {
        return this.email;
    }
    public String getDescription()
    {
        return this.description;
    }
    public String getAddress()
    {
        return this.address;
    }
    public String getPostcode()
    {
        return this.postcode;
    }
    

    
}

/**
 * @author jimivine
 *
 *
 */
package Objects;

public class University {

    protected int uniid;
    protected String uniname;
    protected String uniaddr1;
    protected String uniaddr2;
    protected String uniaddr3;
    protected String uniaddr4;
    protected String unipostcode;
    protected String uniemail;
    protected String unidescription;

    public University(int id, String name, String add1, String add2, String add3, String add4, String postcode, String email, String desc) {
        this.uniname = name;
        this.uniid = id;
        this.unidescription = desc;
        this.uniaddr1 = add1;
        this.uniaddr2 = add2;
        this.uniaddr3 = add3;
        this.uniaddr4 = add4;
        this.unipostcode = postcode;
        this.uniemail = email;
        this.unidescription = desc;
    }

    public University(String name) {
        this.uniname = name;
    }

    public String getUniName() {
        return this.uniname;
    }
}

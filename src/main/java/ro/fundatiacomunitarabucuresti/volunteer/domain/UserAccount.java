package ro.fundatiacomunitarabucuresti.volunteer.domain;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.persistence.ManyToOne;

@RooToString
@RooJpaActiveRecord(inheritanceType = "JOINED")
public abstract class UserAccount {

    /**
     */
    @NotNull
    @Column(unique = true)
    private String userName;

    /**
     */
    @NotNull
    private String password;

    /**
     */
    @NotNull
    private String firstName;

    /**
     */
    @NotNull
    private String lastName;

    /**
     */
    @NotNull
    private String phone;

    /**
     */
    @NotNull
    private String email;

    /**
     */
    @NotNull
    @ManyToOne
    private City city;

    /**
     */
    @NotNull
    private Boolean enabled = Boolean.FALSE;

    public String getUserName() {
        return this.userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return this.firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return this.lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public City getCity() {
        return this.city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public Boolean getEnabled() {
        return this.enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
    
}

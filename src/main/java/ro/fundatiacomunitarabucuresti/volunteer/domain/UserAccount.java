package ro.fundatiacomunitarabucuresti.volunteer.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.persistence.ManyToOne;

@RooJavaBean
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
    private Boolean enabled;
}

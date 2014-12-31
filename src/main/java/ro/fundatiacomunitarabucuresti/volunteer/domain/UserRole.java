package ro.fundatiacomunitarabucuresti.volunteer.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "user_roles")
public class UserRole {

    /**
     */
    @NotNull
    @ManyToOne
    private UserAccount userAccount;

    /**
     */
    @NotNull
    private String roleName;
}

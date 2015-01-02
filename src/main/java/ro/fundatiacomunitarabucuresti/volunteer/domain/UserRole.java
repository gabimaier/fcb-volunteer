package ro.fundatiacomunitarabucuresti.volunteer.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import ro.fundatiacomunitarabucuresti.volunteer.domain.dictionaries.Roles;

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

    public UserRole(){}

    public UserRole(UserAccount userAccount, Roles role) {
        this.userAccount = userAccount;
        this.roleName = role.name();
    }
}

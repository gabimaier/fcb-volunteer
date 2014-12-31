package ro.fundatiacomunitarabucuresti.volunteer.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "volunteers")
public class Volunteer extends UserAccount {

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Skill> skills = new HashSet<Skill>();

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Skill> expertSkills = new HashSet<Skill>();
}

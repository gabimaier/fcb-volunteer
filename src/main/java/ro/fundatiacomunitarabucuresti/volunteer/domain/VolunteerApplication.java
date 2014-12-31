package ro.fundatiacomunitarabucuresti.volunteer.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "volunteer_applications")
public class VolunteerApplication {

    /**
     */
    private Boolean accepted;

    /**
     */
    @NotNull
    @ManyToOne
    private Volunteer volunteer;

    /**
     */
    @NotNull
    @ManyToOne
    private Project project;
}

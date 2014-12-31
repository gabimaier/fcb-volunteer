package ro.fundatiacomunitarabucuresti.volunteer.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.persistence.Column;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Future;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "projects")
public class Project {

    /**
     */
    @NotNull
    @ManyToOne
    private Organization organization;

    /**
     */
    @NotNull
    @Column(unique = true)
    @Size(min = 1, max = 250)
    private String title;

    /**
     */
    @NotNull
    private String description;

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Tag> tags = new HashSet<Tag>();

    /**
     */
    @NotNull
    @ManyToMany(cascade = CascadeType.ALL)
    private List<Skill> requiredSkills = new ArrayList<Skill>();

    /**
     */
    @NotNull
    @Future
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date startDate;

    /**
     */
    private Boolean accepted;

    /**
     */
    @NotNull
    private String initialFeedback;

    /**
     */
    private String results;

    /**
     */
    private String progress;

    /**
     */
    @NotNull
    @ManyToOne
    private City city;

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<VolunteerApplication> volunteers = new HashSet<VolunteerApplication>();
}

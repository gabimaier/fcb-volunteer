// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.fundatiacomunitarabucuresti.volunteer.domain;

import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import ro.fundatiacomunitarabucuresti.volunteer.domain.VolunteerDataOnDemand;
import ro.fundatiacomunitarabucuresti.volunteer.domain.VolunteerIntegrationTest;
import ro.fundatiacomunitarabucuresti.volunteer.services.VolunteerService;

privileged aspect VolunteerIntegrationTest_Roo_IntegrationTest {
    
    declare @type: VolunteerIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: VolunteerIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: VolunteerIntegrationTest: @Transactional;
    
    @Autowired
    VolunteerDataOnDemand VolunteerIntegrationTest.dod;
    
    @Autowired
    VolunteerService VolunteerIntegrationTest.volunteerService;
    
    @Test
    public void VolunteerIntegrationTest.testCountAllVolunteers() {
        Assert.assertNotNull("Data on demand for 'Volunteer' failed to initialize correctly", dod.getRandomVolunteer());
        long count = volunteerService.countAllVolunteers();
        Assert.assertTrue("Counter for 'Volunteer' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void VolunteerIntegrationTest.testFindVolunteer() {
        Volunteer obj = dod.getRandomVolunteer();
        Assert.assertNotNull("Data on demand for 'Volunteer' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Volunteer' failed to provide an identifier", id);
        obj = volunteerService.findVolunteer(id);
        Assert.assertNotNull("Find method for 'Volunteer' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Volunteer' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void VolunteerIntegrationTest.testFindAllVolunteers() {
        Assert.assertNotNull("Data on demand for 'Volunteer' failed to initialize correctly", dod.getRandomVolunteer());
        long count = volunteerService.countAllVolunteers();
        Assert.assertTrue("Too expensive to perform a find all test for 'Volunteer', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Volunteer> result = volunteerService.findAllVolunteers();
        Assert.assertNotNull("Find all method for 'Volunteer' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Volunteer' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void VolunteerIntegrationTest.testFindVolunteerEntries() {
        Assert.assertNotNull("Data on demand for 'Volunteer' failed to initialize correctly", dod.getRandomVolunteer());
        long count = volunteerService.countAllVolunteers();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Volunteer> result = volunteerService.findVolunteerEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Volunteer' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Volunteer' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void VolunteerIntegrationTest.testFlush() {
        Volunteer obj = dod.getRandomVolunteer();
        Assert.assertNotNull("Data on demand for 'Volunteer' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Volunteer' failed to provide an identifier", id);
        obj = volunteerService.findVolunteer(id);
        Assert.assertNotNull("Find method for 'Volunteer' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyVolunteer(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Volunteer' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void VolunteerIntegrationTest.testUpdateVolunteerUpdate() {
        Volunteer obj = dod.getRandomVolunteer();
        Assert.assertNotNull("Data on demand for 'Volunteer' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Volunteer' failed to provide an identifier", id);
        obj = volunteerService.findVolunteer(id);
        boolean modified =  dod.modifyVolunteer(obj);
        Integer currentVersion = obj.getVersion();
        Volunteer merged = (Volunteer)volunteerService.updateVolunteer(obj);
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Volunteer' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void VolunteerIntegrationTest.testSaveVolunteer() {
        Assert.assertNotNull("Data on demand for 'Volunteer' failed to initialize correctly", dod.getRandomVolunteer());
        Volunteer obj = dod.getNewTransientVolunteer(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Volunteer' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Volunteer' identifier to be null", obj.getId());
        try {
            volunteerService.saveVolunteer(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'Volunteer' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void VolunteerIntegrationTest.testDeleteVolunteer() {
        Volunteer obj = dod.getRandomVolunteer();
        Assert.assertNotNull("Data on demand for 'Volunteer' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Volunteer' failed to provide an identifier", id);
        obj = volunteerService.findVolunteer(id);
        volunteerService.deleteVolunteer(obj);
        obj.flush();
        Assert.assertNull("Failed to remove 'Volunteer' with identifier '" + id + "'", volunteerService.findVolunteer(id));
    }
    
}

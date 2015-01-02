package ro.fundatiacomunitarabucuresti.volunteer.services;
import org.springframework.roo.addon.layers.service.RooService;
import ro.fundatiacomunitarabucuresti.volunteer.domain.City;

import java.util.List;

@RooService(domainTypes = { ro.fundatiacomunitarabucuresti.volunteer.domain.City.class })
public interface CityService {
    List<City> findAllCitys();
}

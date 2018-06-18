package ru.olexerciss.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import ru.olexerciss.entity.FeatureEntity;
import ru.olexerciss.service.FeatureEntityService;

import java.util.List;

@Controller
@RequestMapping("/featureentity")
public class FeatureEntityController {
    @Autowired
    private FeatureEntityService featureEntityService;

    @RequestMapping(value = "/add", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public FeatureEntity addFeatureEntity(@RequestBody FeatureEntity featureEntity){
        return featureEntityService.addFeatureEntity(featureEntity);
    }

    @RequestMapping(value = "/all", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    @ResponseBody
    public List<FeatureEntity> getAllFeatureEntities(){
        return featureEntityService.getAllFeatureEntities();
    }

    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    @ResponseBody
    public FeatureEntity getFeatureEntityById(@PathVariable(value = "id") String id){
        // exception
        return featureEntityService.getFeatureEntityById(Long.parseLong(id));
    }

    // localhost:8080/cat/delete?id=5&name=Jack
    @RequestMapping(value = "/delete", method = RequestMethod.DELETE, produces = "application/json;charset=utf-8")
    @ResponseBody
    public FeatureEntity deleteFeatureEntity(@RequestParam(value = "id") String id) {
        return featureEntityService.deleteFeatureEntity(Long.parseLong(id));
    }

    @RequestMapping(value = "/upd", method = RequestMethod.PUT, produces = "application/json;charset=utf-8")
    @ResponseBody
    public FeatureEntity updFeatureEntity(@RequestBody FeatureEntity featureEntity){
        return featureEntityService.updFeatureEntity(featureEntity);
    }
}

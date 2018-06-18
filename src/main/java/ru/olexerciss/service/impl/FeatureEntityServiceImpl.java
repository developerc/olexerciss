package ru.olexerciss.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.olexerciss.dao.FeatureEntityDao;
import ru.olexerciss.entity.FeatureEntity;
import ru.olexerciss.service.FeatureEntityService;

import java.util.List;

@Service("featureEntityService")
public class FeatureEntityServiceImpl implements FeatureEntityService {
    @Autowired
    private FeatureEntityDao featureEntityDao;

    @Override
    public FeatureEntity addFeatureEntity(FeatureEntity featureEntity) {
        return featureEntityDao.create(featureEntity);
    }

    @Override
    public List<FeatureEntity> getAllFeatureEntities() {
        return featureEntityDao.getList();
    }

    @Override
    public FeatureEntity getFeatureEntityById(long id) {
        return featureEntityDao.getById(id);
    }

    @Override
    public FeatureEntity deleteFeatureEntity(long id) {
        return featureEntityDao.delete(featureEntityDao.getById(id));
    }

    @Override
    public FeatureEntity updFeatureEntity(FeatureEntity featureEntity) {
        return featureEntityDao.update(featureEntity);
    }
}

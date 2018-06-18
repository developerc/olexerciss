package ru.olexerciss.dao.impl;

import ru.olexerciss.dao.FeatureEntityDao;
import ru.olexerciss.entity.FeatureEntity;

public class FeatureEntityDaoImpl extends BasicDaoImpl<FeatureEntity> implements FeatureEntityDao {
    public FeatureEntityDaoImpl(Class<FeatureEntity> entityClass) {
        super(entityClass);
    }
}

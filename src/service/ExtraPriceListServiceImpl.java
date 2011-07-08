package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import persistence.mybatis.mappers.ExtraMapper;
import persistence.mybatis.mappers.ExtraPriceListItemMapper;
import persistence.mybatis.mappers.ExtraPriceListMapper;

import model.Extra;
import model.listini.ExtraPriceList;
import model.listini.ExtraPriceListItem;

@Service
public class ExtraPriceListServiceImpl implements ExtraPriceListService{
	@Autowired
	private ExtraPriceListItemMapper extraPriceListItemMapper = null;
	@Autowired
	private ExtraPriceListMapper extraPriceListMapper = null;
	@Autowired
	private ExtraMapper extraMapper = null;
	

	@Override
	public Integer insertExtraPriceList(ExtraPriceList extraPriceList) {
		Integer ret = 0;
		
		this.getExtraPriceListMapper().insertExtraPriceList(extraPriceList);
		for(ExtraPriceListItem each: extraPriceList.getItems()) {
			each.setId_extraPriceList(extraPriceList.getId());
			this.getExtraPriceListItemMapper().insertExtraPriceListItem(each);
		}
		return ret;
	}
	
	

	@Override
	public Integer insertExtraPriceListItem(ExtraPriceListItem extraPriceListItem) {
		
		return this.getExtraPriceListItemMapper().insertExtraPriceListItem(extraPriceListItem);
	}

	@Override
	public List<ExtraPriceList> findExtraPriceListsByIdStructure(Integer id_structure) {
		List<ExtraPriceList> extraPriceLists = null;
		List<ExtraPriceListItem> extraPriceListItems = null;
		
		extraPriceLists = this.getExtraPriceListMapper().findExtraPriceListsByIdStructure(id_structure);
		for (ExtraPriceList each : extraPriceLists) {
			extraPriceListItems = this.getExtraPriceListItemMapper().findExtraPriceListItemsByIdExtraPriceList(each.getId());
			each.setItems(extraPriceListItems);
		}
		return extraPriceLists;
	}

	@Override
	public ExtraPriceList findExtraPriceListByIdStructureAndIdSeasonAndIdRoomTypeAndIdConvention(Integer id_structure, Integer id_season, Integer id_roomType, Integer id_convention) {
		ExtraPriceList ret = null;
		Map map = null;
		List<ExtraPriceListItem> extraPriceListItems;
		Extra extra = null;
		
		map = new HashMap();
		map.put("id_structure", id_structure);
		map.put("id_season", id_season);
		map.put("id_roomType", id_roomType);
		map.put("id_convention", id_convention);
		ret = this.getExtraPriceListMapper().findExtraPriceListByIdStructureAndIdSeasonAndIdRoomTypeAndIdConvention(map);
		if (ret != null) {
			extraPriceListItems = this.getExtraPriceListItemMapper().findExtraPriceListItemsByIdExtraPriceList(ret.getId());
			for (ExtraPriceListItem each : extraPriceListItems) {
				extra = this.getExtraMapper().findExtraById(each.getId_extra());
				each.setExtra(extra);
			}
			ret.setItems(extraPriceListItems);
		}
		return ret;
	}

	

	@Override
	public ExtraPriceList findExtraPriceListById(Integer id) {
		ExtraPriceList extraPriceList = null;
		List<ExtraPriceListItem> extraPriceListItems = null;
		
		extraPriceList = this.getExtraPriceListMapper().findExtraPriceListById(id);
		extraPriceListItems = this.getExtraPriceListItemMapper().findExtraPriceListItemsByIdExtraPriceList(extraPriceList.getId());
		extraPriceList.setItems(extraPriceListItems);
		return extraPriceList;
	}

	@Override
	public Integer deleteExtraPriceListById(Integer id) {
		Integer ret = 0;
		
		this.getExtraPriceListItemMapper().deleteExtraPriceListItemsByIdExtraPriceList(id);
		ret = this.getExtraPriceListMapper().deleteExtraPriceListById(id);
		return ret;
	}

	
	@Override
	public Integer updateExtraPriceListItem(ExtraPriceListItem extraPriceListItem) {
		
		return this.getExtraPriceListItemMapper().updateExtraPriceListItem(extraPriceListItem);
	}



	public ExtraPriceListItemMapper getExtraPriceListItemMapper() {
		return extraPriceListItemMapper;
	}
	public void setExtraPriceListItemMapper(
			ExtraPriceListItemMapper extraPriceListItemMapper) {
		this.extraPriceListItemMapper = extraPriceListItemMapper;
	}
	public ExtraPriceListMapper getExtraPriceListMapper() {
		return extraPriceListMapper;
	}
	public void setExtraPriceListMapper(ExtraPriceListMapper extraPriceListMapper) {
		this.extraPriceListMapper = extraPriceListMapper;
	}
	public ExtraMapper getExtraMapper() {
		return extraMapper;
	}
	public void setExtraMapper(ExtraMapper extraMapper) {
		this.extraMapper = extraMapper;
	}
	

}

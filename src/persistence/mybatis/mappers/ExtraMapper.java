package persistence.mybatis.mappers;

import java.util.List;
import java.util.Map;

import model.Extra;
import model.listini.Period;
import model.listini.Season;

public interface ExtraMapper {
	public List<Extra> findExtrasByIdStructure(Integer id_structure);
	public Integer insertExtra(Extra extra);
	public Extra findExtraById(Integer id);
	public Integer updateExtra(Extra extra);
	public Integer deleteExtra(Integer id);
	

}

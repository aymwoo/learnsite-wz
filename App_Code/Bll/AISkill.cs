using System;
using System.Data;
using System.Collections.Generic;
using LearnSite.Model;
namespace LearnSite.BLL
{
    /// <summary>
    /// 业务逻辑类:AISkill
    /// </summary>
    public partial class AISkill
    {
        private readonly LearnSite.DAL.AISkill dal=new LearnSite.DAL.AISkill();
        public AISkill()
        {}
        #region  Method

        public int Add(LearnSite.Model.AISkill model)
        {
            return dal.Add(model);
        }

        public bool Update(LearnSite.Model.AISkill model)
        {
            return dal.Update(model);
        }

        public bool Delete(int Id)
        {
            return dal.Delete(Id);
        }

        public LearnSite.Model.AISkill GetModel(int Id)
        {
            return dal.GetModel(Id);
        }

        public DataSet GetList(string strWhere)
        {
            return dal.GetList(strWhere);
        }

        public List<LearnSite.Model.AISkill> GetModelList(string strWhere)
        {
            DataSet ds = dal.GetList(strWhere);
            return DataTableToList(ds.Tables[0]);
        }

        public List<LearnSite.Model.AISkill> DataTableToList(DataTable dt)
        {
            List<LearnSite.Model.AISkill> modelList = new List<LearnSite.Model.AISkill>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.AISkill model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = dal.DataRowToModel(dt.Rows[n]);
                    if (model != null)
                    {
                        modelList.Add(model);
                    }
                }
            }
            return modelList;
        }

        #endregion  Method
    }
}

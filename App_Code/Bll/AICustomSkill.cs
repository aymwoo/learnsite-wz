using System;
using System.Data;
using System.Collections.Generic;
using LearnSite.Model;

namespace LearnSite.BLL
{
    /// <summary>
    /// 业务逻辑类:AICustomSkill
    /// </summary>
    public partial class AICustomSkill
    {
        private readonly LearnSite.DAL.AICustomSkill dal = new LearnSite.DAL.AICustomSkill();

        public AICustomSkill()
        {}

        #region  Method

        public int Add(LearnSite.Model.AICustomSkill model)
        {
            return dal.Add(model);
        }

        public bool Update(LearnSite.Model.AICustomSkill model)
        {
            return dal.Update(model);
        }

        public bool Delete(int Id)
        {
            return dal.Delete(Id);
        }

        public LearnSite.Model.AICustomSkill GetModel(int Id)
        {
            return dal.GetModel(Id);
        }

        public DataSet GetList(string strWhere)
        {
            return dal.GetList(strWhere);
        }

        public List<LearnSite.Model.AICustomSkill> GetModelList(string strWhere)
        {
            DataSet ds = dal.GetList(strWhere);
            return DataTableToList(ds.Tables[0]);
        }

        public List<LearnSite.Model.AICustomSkill> DataTableToList(DataTable dt)
        {
            List<LearnSite.Model.AICustomSkill> modelList = new List<LearnSite.Model.AICustomSkill>();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                LearnSite.Model.AICustomSkill model;
                for (int n = 0; n < rowsCount; n++)
                {
                    model = dal.DataRowToModel(dt.Rows[n]);
                    if (model != null)
                        modelList.Add(model);
                }
            }
            return modelList;
        }

        #endregion  Method
    }
}

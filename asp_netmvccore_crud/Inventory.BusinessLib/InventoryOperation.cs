using System;
using System.Collections.Generic;
using System.Text;
using Inventory.Datalayer.Models;
using Inventory.Datalayer.Repository;

namespace Inventory.BusinessLib
{
    public class ProductOperation : IProductOperation
    {
        public IList<Products> GetProducts()
        {
            try
            {
                IList<Products> products = new List<Products>();
                IDbRepository<Products> ProdOperation = new DbRepository<Products>();
                products = ProdOperation.FindAll() as IList<Products>;
                return products;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
    public interface IProductOperation
    {
        IList<Products> GetProducts();
    }
}

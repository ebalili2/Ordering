using Ordering_Model;
using Ordering_Repository.Abstract;
using Ordering_Repository.Interface;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ordering_Repository
{
    public class CleverbitProductRepository : ProductRepository, IProductRepository
    {
        public override Product GetProduct(int productId)
        {
            try
            {
                using (var context = new CleverbitDBContext())
                {
                    var result = context.Products.FirstOrDefault(x => x.Id == productId);
                    return result;
                }
            }
            catch (Exception ex)
            {
                //log error
                throw ex;
            }
        }

        public override Product UpdateProduct(Product product)
        {
            try
            {
                using (var context = new CleverbitDBContext())
                {
                    var dbProduct = context.Products.FirstOrDefault(x => x.Id == product.Id);

                    dbProduct.IsPopular = product.IsPopular;
                    dbProduct.Name = product.Name;
                    dbProduct.Price = product.Price;

                    context.Entry(dbProduct).State = EntityState.Modified;
                    context.SaveChanges();
                    return dbProduct;
                }
            }
            catch (Exception ex)
            {
                //log error
                throw ex;
            }
        }
    }
}

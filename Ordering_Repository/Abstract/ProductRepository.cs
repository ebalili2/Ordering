using Ordering_Model;
using Ordering_Repository.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ordering_Repository.Abstract
{
    public abstract class ProductRepository : IProductRepository
    {
        public Product CreateProduct(Product product)
        {
            throw new NotImplementedException();
        }

        public Product DeleteProduct(int productId)
        {
            throw new NotImplementedException();
        }

        public abstract Product GetProduct(int productId);

        public List<Product> GetProducts()
        {
            throw new NotImplementedException();
        }

        public abstract Product UpdateProduct(Product product);
    }
}

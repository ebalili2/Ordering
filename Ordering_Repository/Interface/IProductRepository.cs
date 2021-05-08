using Ordering_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ordering_Repository.Interface
{
    public interface IProductRepository
    {
        List<Product> GetProducts();
        Product GetProduct(int productId);
        Product CreateProduct(Product product);
        Product UpdateProduct(Product product);
        Product DeleteProduct(int productId);
    }
}

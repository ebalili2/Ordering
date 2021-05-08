using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ordering_Model
{
    [Table("Product")]
    public class Product
    {
        [Key]
        [Column("ProductId")]
        public int Id { get; set; }

        public string Name { get; set; }

        public byte IsPopular { get; set; }

        public decimal Price { get; set; }
    }
}

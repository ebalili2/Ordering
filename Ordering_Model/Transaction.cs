using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ordering_Model
{
    [Table("Transaction")]
    public class Transaction
    {
        [Key]
        [Column("TransactionId")]
        public int Id { get; set; }

        public int UserId { get; set; }
        public int ProductId { get; set; }
        public int TransactionTypeId { get; set; }

        public decimal Amount { get; set; }
        
    }
}

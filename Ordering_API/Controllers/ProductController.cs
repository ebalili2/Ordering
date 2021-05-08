using Ordering_Repository.Interface;
using Ordering_Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using RouteAttribute = System.Web.Http.RouteAttribute;
using Ordering_Model;

namespace Ordering_API.Controllers
{
    public class ProductController : ApiController
    {
        IProductRepository _productRepository { get; set; }

        public ProductController()
        {
            //use dependency injection
            _productRepository = new CleverbitProductRepository();
        }

        // GET: Product
        [Route("api/product/")]
        [HttpGet]
        //[Authorize]
        public IHttpActionResult Get()
        {
            try
            {
                var result = _productRepository.GetProducts();
                if (result == null)
                {
                    return ResponseMessage(Request.CreateErrorResponse(HttpStatusCode.NotFound, "No products found."));
                }
                return Ok(result);
            }
            catch (Exception ex)
            {
                //log error
                return ResponseMessage(Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message));
            }
        }

        [Route("api/product/{productId}")]
        [HttpGet]
        //[Authorize]
        public IHttpActionResult GetProduct(int productId)
        {
            try
            {
                var result = _productRepository.GetProducts();
                if (result == null)
                {
                    return ResponseMessage(Request.CreateErrorResponse(HttpStatusCode.NotFound, "Product not found."));
                }
                return Ok(result);
            }
            catch (Exception ex)
            {
                //log error
                return ResponseMessage(Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message));
            }
        }

        [Route("api/product/{productId}")]
        [HttpPost]
        //[Authorize]
        public IHttpActionResult Update([FromBody] Product product)
        {
            try
            {
                var result = _productRepository.UpdateProduct(product);
                if (result == null)
                {
                    return ResponseMessage(Request.CreateErrorResponse(HttpStatusCode.NotFound, "Product not found."));
                }
                return Ok(result);
            }
            catch (Exception ex)
            {
                //log error
                return ResponseMessage(Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex.Message));
            }
        }
    }
}
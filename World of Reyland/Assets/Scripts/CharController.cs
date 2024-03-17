using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CharController : MonoBehaviour
{
    [SerializeField] Rigidbody2D rb;

    float x;
    float y;
    [SerializeField] float speed;
    [SerializeField] float jumpForce;
    bool facingRight = false;
    bool invertSprite = false;
    float startingScale;
    int jumpInt;
    bool isGrounded;
    [SerializeField] Transform groundCheckCollider;
    [SerializeField] LayerMask groundLayer;

    private void Start() {
        rb = GetComponent<Rigidbody2D>();

        startingScale = transform.localScale.x;
    }

    private void Update() {
        x = Input.GetAxisRaw("Horizontal");

        if (Input.GetAxisRaw("Vertical") >= 1)
        {
            Jump();
        }
    }

    private void FixedUpdate() {
        Move(x);
        GroundCheck();

        CapsuleCollider2D capsuleCollider2D = GetComponent<CapsuleCollider2D>();
    }

    private void GroundCheck()
    {

        Collider2D[] collider = Physics2D.OverlapCircleAll(groundCheckCollider.position, 0.1f,groundLayer);

        //List<Collider2D> cc = new List<Collider2D>();


        if (collider.Length > 0)
        {
            isGrounded = true;
           
        }
        else
        {
            isGrounded = false;
        }

    }

    private void Move(float dir){
        float xVel = dir * speed * 100 * Time.deltaTime;

  
        Vector2 targetVel = new Vector2(xVel, rb.velocity.y);
        rb.velocity = targetVel;
        if(facingRight && dir < 0){

            transform.localScale = new Vector3(-1 * (invertSprite ? 1 : -1),1,1) * startingScale;
            facingRight = false;

        } else if (!facingRight && dir > 0){
            transform.localScale = new Vector3(1 * (invertSprite ? 1 : -1), 1,1) * startingScale;
            facingRight = true;
        }
    }

    private void Jump()
    {
        if (isGrounded)
        {
            rb.velocity = new Vector2(0, 1) * jumpForce;
        }
    }

    private void OnDrawGizmosSelected()
    {
        Gizmos.color = Color.yellow;
        Gizmos.DrawSphere(groundCheckCollider.position, 0.1f);
    }
}

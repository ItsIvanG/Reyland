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
    Camera cam;
    public Vector2 mouseCursor;

    private void Start() {
        rb = GetComponent<Rigidbody2D>();
        cam = Camera.main; 
        startingScale = transform.localScale.x;
    }

    private void Update() {
        x = Input.GetAxisRaw("Horizontal");

        if (Input.GetAxisRaw("Vertical") >= 1)
        {
            Jump();
        }

        mouseCursor = cam.ScreenToWorldPoint(Input.mousePosition);
        if (mouseCursor.x < transform.position.x)
        {
            facingRight = false;
        }
        else
        {
            facingRight = true;
        }

    }

    private void FixedUpdate() {

        if (x != 0)
        {
            Move(x);
        }
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
        if(facingRight ){

            transform.localScale = new Vector3(1 * (invertSprite ? 1 : -1),1,1) * startingScale;


        } else if (!facingRight ){

            transform.localScale = new Vector3(-1 * (invertSprite ? 1 : -1), 1,1) * startingScale;

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

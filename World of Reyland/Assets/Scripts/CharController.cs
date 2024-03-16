using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CharController : MonoBehaviour
{
    [SerializeField] Rigidbody2D rb;
    float x;
    [SerializeField] float speed;
    bool facingRight = false;

    private void Start() {
        rb = GetComponent<Rigidbody2D>();
    }

    private void Update() {
        x = Input.GetAxisRaw("Horizontal");
    }

    private void FixedUpdate() {
        Move(x);
    }

    private void Move(float dir){
        float xVel = dir * speed * 100 * Time.deltaTime;
        Vector2 targetVel = new Vector2(xVel, rb.velocity.y);
        rb.velocity = targetVel;
        if(facingRight && dir < 0){

            transform.localScale = new Vector3(-1,1,1);
            facingRight = false;

        } else if (!facingRight && dir > 0){
            transform.localScale = new Vector3(1,1,1);
            facingRight = true;
        }
    }
}

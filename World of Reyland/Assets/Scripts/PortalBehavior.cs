using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PortalBehavior : MonoBehaviour
{
    [SerializeField] GameObject checkWall;
    [SerializeField] LayerMask groundLayer;
    [SerializeField]
    Sprite[] PortalSprites;
    Vector3 startingScale;
    public int whatPortal = 0;
    SpriteRenderer spr;
    public bool PortalActive = true;
    private void Awake()
    {
        startingScale = transform.localScale;
    }
    private void Start()
    {
        spr = GetComponentInChildren<SpriteRenderer>();
        spr.sprite = PortalSprites[whatPortal];
    }
    private void FixedUpdate()
    {
        CheckWall();
    }

    private void OnDrawGizmosSelected()
    {
        Gizmos.color = Color.yellow;
        Gizmos.DrawSphere(checkWall.transform.position, 0.1f);
    }

    void CheckWall()
    {
        Collider2D[] collider = Physics2D.OverlapCircleAll(checkWall.transform.position, 0.1f, groundLayer);

        if(collider.Length > 0)
        {

        }
        else
        {
            if(transform.rotation.z == 0)
            {
                transform.localScale = new Vector3(transform.localScale.x*- 1,startingScale.x, startingScale.x);
            }
            else
            {
                transform.localScale = new Vector3(startingScale.x, startingScale.x, startingScale.x);
            }
        }

        if (transform.rotation.z != 0)
        {
            transform.localScale = new Vector3(startingScale.x, startingScale.x, startingScale.x);
        }
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        Debug.Log("PORTAL!!");

        if (whatPortal == 1 && PortalManager.instance.portal2Scene==null)
        {
            return;
        }
        else if (whatPortal == 2 && PortalManager.instance.portal1Scene == null)
        {
            return;
        }

            collision.GetComponentInChildren<CapsuleCollider2D>().excludeLayers = LayerMask.GetMask("Ground");

    }

    private void OnTriggerExit2D(Collider2D collision)
    {
        collision.GetComponentInChildren<CapsuleCollider2D>().excludeLayers = LayerMask.GetMask("Nothing");
        PortalActive = true;
    }
}

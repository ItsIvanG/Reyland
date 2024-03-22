using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GatewayBehavior : MonoBehaviour
{
    [SerializeField] PortalBehavior PortalBehavior;

    int doMoment;
    Collider2D cc;
    float objVelocity;
    GameObject otherPortal;
    private void OnTriggerEnter2D(Collider2D collision)
    {
         objVelocity = collision.GetComponent<Rigidbody2D>().velocity.magnitude;
        cc = collision;



        if (objVelocity > 15)
            objVelocity = 15;

        Debug.Log("objV: " + objVelocity);

        if (PortalBehavior.PortalActive)
        {
            if (PortalBehavior.whatPortal == 1 )
            {
                collision.transform.position = PortalManager.instance.portal2Scene.transform.position;
                otherPortal = PortalManager.instance.portal2Scene;


                PortalManager.instance.portal2Scene.GetComponent<PortalBehavior>().PortalActive = false;
            }
            else if (PortalBehavior.whatPortal == 2 )
            {
                collision.transform.position = PortalManager.instance.portal1Scene.transform.position;
                otherPortal = PortalManager.instance.portal1Scene;

                PortalManager.instance.portal1Scene.GetComponent<PortalBehavior>().PortalActive = false;
            }

            if(otherPortal.transform.localScale.x < 0 )
            {
                //IF PORTAL IS FLIPPED
                collision.GetComponent<Rigidbody2D>().velocity = -(Vector2)otherPortal.transform.right * objVelocity;

            }
            else
            {
                collision.GetComponent<Rigidbody2D>().velocity = (Vector2)otherPortal.transform.right * objVelocity;

            }

            Debug.Log("RIGHT: " + transform.parent.right);


            //cc = collision;
            //doMoment = (int)objVelocity;

        }

    }
    private void OnTriggerExit2D(Collider2D collision)
    {
        PortalBehavior.PortalActive = true;
        collision.GetComponentInChildren<CapsuleCollider2D>().excludeLayers = LayerMask.GetMask("Nothing");
    }



}

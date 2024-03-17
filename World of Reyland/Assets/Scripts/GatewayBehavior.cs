using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GatewayBehavior : MonoBehaviour
{
    [SerializeField] PortalBehavior PortalBehavior;
    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (PortalBehavior.PortalActive)
        {
            if (PortalBehavior.whatPortal == 1 )
            {
                collision.transform.position = PortalManager.instance.portal2Scene.transform.position;
                
                PortalManager.instance.portal2Scene.GetComponent<PortalBehavior>().PortalActive = false;
            }
            else if (PortalBehavior.whatPortal == 2 )
            {
                collision.transform.position = PortalManager.instance.portal1Scene.transform.position;
                PortalManager.instance.portal1Scene.GetComponent<PortalBehavior>().PortalActive = false;
            }
        }
       
    }
    private void OnTriggerExit2D(Collider2D collision)
    {
        PortalBehavior.PortalActive = true;
        collision.GetComponentInChildren<CapsuleCollider2D>().excludeLayers = LayerMask.GetMask("Nothing");
    }
}

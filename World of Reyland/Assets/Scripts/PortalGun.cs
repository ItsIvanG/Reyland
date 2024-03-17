using System.Collections;
using System.Collections.Generic;
using Unity.Burst.CompilerServices;
using UnityEngine;

public class PortalGun : MonoBehaviour
{
   [SerializeField] GameObject Player;
    [SerializeField] GameObject PortalTest;
    Vector2 mouseCursor;
    Camera cam;
    Ray2D ray;
    private void Start()
    {
        Player = FindFirstObjectByType<CharController>().gameObject;
        cam = Camera.main;
    }
    void Update()
    {

        mouseCursor = cam.ScreenToWorldPoint(Input.mousePosition);

        
        ray = new Ray2D(Player.transform.position, mouseCursor);
        Debug.DrawRay(ray.origin, mouseCursor- (Vector2)Player.transform.position, Color.red);
        RaycastHit2D hit;

        if (hit = Physics2D.Raycast(ray.origin, mouseCursor - (Vector2)Player.transform.position, 200))
        {

            Vector2 lookAt = Vector3.Cross(-hit.normal, Player.transform.right);

            PortalTest.transform.position = hit.point;
            PortalTest.transform.rotation = Quaternion.Euler(0,0, hit.normal.y * 90f);

        }


    }
 
}
